# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-jre-large" do
  version "8,272:b10"
  sha256 "0cc0911c7af2f09ddb4ffe8677269da9fa647cb36d45190442c20d592992fa98"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u272-b10.1_openj9-0.23.0/OpenJDK8U-jre_x64_mac_openj9_macosXL_8u272b10_openj9-0.23.0.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (JRE) (XL)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jre_x64_mac_openj9_macosXL_8u272b10_openj9-0.23.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jre"
end
