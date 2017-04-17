Pod::Spec.new do |s|

s.name              = 'OGCircularBar'
s.version           = '1.0'
s.summary           = 'Circular progress bar for macOS'
s.homepage          = 'https://github.com/OskarGroth/OGCircularBar'
s.license           = {
:type => 'MIT',
:file => 'LICENSE'
}
s.author            = {
'Oskar Groth' => 'oskar@cindori.org'
}
s.source            = {
:git => 'https://github.com/OskarGroth/OGCircularBar.git',
:tag => s.version.to_s
}
s.platform     = :osx, '10.9'
s.source_files = 'OGCircularBar/*.{swift}'
s.requires_arc = true
s.screenshot   = "https://s3.amazonaws.com/cindori/images/circularbar.png"
s.social_media_url = "https://twitter.com/cindoriapps"

end
