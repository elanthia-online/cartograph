#!/usr/bin/env ruby
require "socket"
require "openssl"
require "zlib"
require "fileutils"
require_relative "../../util/opts"
require_relative "../../util/color"
require_relative "../../util/log"
require_relative "./mapdb"

module Repo
	VERSION  = "2.35"
	HOST     = "repo.lichproject.org"
	PORT     = 7157
	CERT     = OpenSSL::X509::Certificate.new("-----BEGIN CERTIFICATE-----\nMIIDlTCCAn2gAwIBAgIJAKuu65i5NsruMA0GCSqGSIb3DQEBCwUAMGExCzAJBgNV\nBAYTAlVTMREwDwYDVQQIDAhJbGxpbm9pczESMBAGA1UECgwJTWF0dCBMb3dlMQ8w\nDQYDVQQDDAZSb290Q0ExGjAYBgkqhkiG9w0BCQEWC21hdHRAaW80LnVzMB4XDTE0\nMDYwNzE3NDUwMFoXDTI0MDYwNDE3NDUwMFowYTELMAkGA1UEBhMCVVMxETAPBgNV\nBAgMCElsbGlub2lzMRIwEAYDVQQKDAlNYXR0IExvd2UxDzANBgNVBAMMBlJvb3RD\nQTEaMBgGCSqGSIb3DQEJARYLbWF0dEBpbzQudXMwggEiMA0GCSqGSIb3DQEBAQUA\nA4IBDwAwggEKAoIBAQCcIRn0IMCNYeL5agKmkdedgJXsIyTJS8qKrY6EvQsq4tt0\nmO3Or9K8IaDl7qFdQ9nfSJ5phNgoCy9wZ9rDWv5FhY5MnnVHGr3fCa7RkMxJFR/N\nwiD4ihQlixOUly76glceyc/6QQS9bNe96evZDstERGAFfzgHY4qAlyurR6mBu9Mb\nyyCRok6xMRnjrbTMNkvvOsuG0sY9ot+SLHGgU3qT7+wVh/CbWcjeF7/Qwa//fbFk\nmq5c1FuvhU3DanSSz+VuWudPFSyZ3r5pYrLMJWsyomDa4gkL2bJ5jya2BWDMXvSS\nCpdQgPDIlClMfAFLd/Ss8ZIGa6uNFcSK6Xca51ClAgMBAAGjUDBOMB0GA1UdDgQW\nBBScbglRiGzz9yzuhgBwFYjgimeByDAfBgNVHSMEGDAWgBScbglRiGzz9yzuhgBw\nFYjgimeByDAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQA7MLZYfqam\n5aaSBqQpT6sOGDtVc9koIok59oTQmNXqe+awg2VUnAiesxtLd+FWGUMp8XzHdGWw\nH3O6kAUkPm/in001X7TRAhbgDujfTRbTzxND0XrjuEzDMALs3YpDM1pMXqC7RXWA\n7z+N0gRaUgmh1rMbk/qA3cAfC2dwf2j3NYy3bDw3lMpdyIwAfOQxiZVglYgX3dgT\nU9b//gsUyPCvlpL0mYcmhOOLt6oqQhMJaw1I6A9xMe2kO2L+8KPGK2u1B+P5/Sx0\nFE8LIp5KA3a7yRbOty19NsGR+yW7WwV7BL6c6GOKb/iKJBLYzTmNG6m16hRrxDGj\ntGu91I0ORptB\n-----END CERTIFICATE-----")
	DOWNLOAD_REQUEST = { 
		'action' => 'download-mapdb', 
		'game'   => "gsiv", 
		'client' => VERSION,
		'supported compressions' => 'gzip',
	}
	
	def self.dial()
		begin
			cert_store              = OpenSSL::X509::Store.new
			cert_store.add_cert(CERT)
			ssl_context             = OpenSSL::SSL::SSLContext.new
			ssl_context.options     = (OpenSSL::SSL::OP_NO_SSLv2 + OpenSSL::SSL::OP_NO_SSLv3)
			ssl_context.cert_store  = cert_store
			if OpenSSL::SSL::VERIFY_PEER == OpenSSL::SSL::VERIFY_NONE
				# the plat_updater script redefines OpenSSL::SSL::VERIFY_PEER, disabling it for everyone
				ssl_context.verify_mode = 1 # probably right
			else
				ssl_context.verify_mode = OpenSSL::SSL::VERIFY_PEER
			end
			socket                  = TCPSocket.new(HOST, PORT)
			ssl_socket              = OpenSSL::SSL::SSLSocket.new(socket, ssl_context)
			ssl_socket.connect
			if (ssl_socket.peer_cert.subject.to_a.find { |n| n[0] == "CN" }[1] != "lichproject.org") and (ssl_socket.peer_cert.subject.to_a.find { |n| n[0] == "CN" }[1] != "Lich Repository")
				if cmd_force
					puts "warning: server certificate hostname mismatch"
				else
					puts "error: server certificate hostname mismatch"
					ssl_socket.close rescue nil
					socket.close rescue nil
					exit
				end
			end
			def ssl_socket.geth
				hash = Hash.new
				gets.scan(/[^\t]+\t[^\t]+(?:\t|\n)/).each { |s| s = s.chomp.split("\t"); hash[s[0].downcase] = s[1] }
				return hash
			end
			def ssl_socket.puth(h)
				puts h.to_a.flatten.join("\t")
			end
		rescue
			puts "error connecting to server: #{$!}"
			ssl_socket.close rescue nil
			socket.close rescue nil
			exit
		end
		[ ssl_socket, socket ]
	end

	def self.bail()
		puts "checksums match ... skipping download"
		exit
	end

	def self.download_mapdb()
		ssl_socket, _socket = Repo.dial()
		ssl_socket.puth(DOWNLOAD_REQUEST)
		response = ssl_socket.geth
		puts "repo.request.headers:"
		response.each do |header, value| puts "#{header.rjust(12)}=#{value}" end
		puts response["warning"] if response['warning']
		fail response["error"] if response["error"]
		bail() if response["md5sum"].eql? MapDB.checksum
		download_dir = File.join(Dir.pwd, "tmp")
		FileUtils.mkdir_p(download_dir,
			verbose: true)
		mapdb_out_file = File.join(download_dir, "mapdb.json")
		checksum_out_file = File.join(download_dir, "checksum")
		puts "downloading mapdb to %s" % download_dir
		inflated = Zlib::GzipReader.new(ssl_socket)
		file = File.new(mapdb_out_file, 'wb')
		file.write(inflated.read)
		File.write(checksum_out_file, response["md5sum"])
	end

	def self.lock_with_checksum()
		new_checksum = File.join(Dir.pwd, "tmp", "checksum")
		FileUtils.cp(new_checksum, MapDB.checksum_file)
		puts "locked with new checksum %s" % MapDB.checksum
	end
end