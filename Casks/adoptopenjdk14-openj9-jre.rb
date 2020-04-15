# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask 'adoptopenjdk14-openj9-jre' do
  version '14,36'
  sha256 '960b435aab756a5a581e3e4eea85a22c3622d35c72e7f7e13a775c071a7f2e29'

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url 'https://github.com/AdoptOpenJDK/openjdk14-binaries/releases/download/jdk-14%2B36.1_openj9-0.19.0/OpenJDK14U-jre_x64_mac_openj9_14_36_openj9-0.19.0.pkg'
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name 'AdoptOpenJDK 14 (OpenJ9) (JRE)'
  homepage 'https://adoptopenjdk.net/'

  pkg 'OpenJDK14U-jre_x64_mac_openj9_14_36_openj9-0.19.0.pkg'

  postflight do
    system_command '/usr/sbin/pkgutil', args: ['--pkg-info', 'net.adoptopenjdk.14-openj9.jre'], print_stdout: true
  end

  uninstall pkgutil: 'net.adoptopenjdk.14-openj9.jre'
end