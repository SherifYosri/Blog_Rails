module FilesHelper
  def base64_to_file(base64, file_name)
    decoded_file = Base64.decode64(base64)
    tmp_file = Tempfile.new(file_name)
    tmp_file.binmode
    tmp_file.write(decoded_file)
    tmp_file.rewind
    tmp_file
  end
end