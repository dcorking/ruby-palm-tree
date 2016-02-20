# http://stackoverflow.com/questions/25177013/print-directory-structure

Repo_dir = '/home/david1/deleteme'

dir = Dir.entries(Repo_dir)
dir.each do |folder|
    if folder == '.' or folder == '..'
        print ""
    else
        print "#{folder}\n"
        if File.directory?( File.join(Repo_dir, folder))
            print "we are here !"
            sub_dir = Dir.entries("#{Repo_dir}#{File::SEPARATOR}#{folder}")
                sub_dir.each do |subdir|
                    print "#{subdir}\n"
                end
        end

    end

end
