=begin
  Jekyll Hook that transform Kramdown links [link](http://exmample.com){:blank} into [link](http://exmample.com){:target="_blank"}

  This facilitates coding and avoids confusion with italic triggered with the underscore in _blank

  Applies to all pages and all posts in .md files
=end

Jekyll::Hooks.register :pages, :pre_render do |page|
    transformDoc(page)
  end
  
  Jekyll::Hooks.register :posts, :pre_render do |post|
    transformDoc(post)
  end
  
  def transformDoc(doc)
    docExt = doc.extname.tr('.', '')
    # only process if we deal with a markdown file
    if (docExt == 'md')
      doc.content = doc.content.gsub(/\[([^\]]*)\]\(([^)]*)\){:blank}/, '[\1](\2){:target="_blank"}')  
    end  
  end
  