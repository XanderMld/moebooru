desc "find if there's any posts missing on file system"
task :find_posts => :environment do
    images_path = "#{Rails.root}/public/data/image/"

    Post.find(:all, :conditions => ["status != 'deleted'"], :order => "id DESC").each { |post|
        md5 = post.md5
        ext = post.file_ext
        path = "#{images_path}/#{md5[0..1]}/#{md5[2..3]}"
        file_name = "#{path}/#{md5}.#{ext}"
        puts "#{md5}.#{ext}" unless File.exists?(file_name)
    }

end
