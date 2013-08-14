require 'formula'
 
class Solr35 < Formula
  homepage 'http://lucene.apache.org/solr/'
  url 'http://archive.apache.org/dist/lucene/solr/3.5.0/apache-solr-3.5.0.tgz'
  sha1 '020fc86dfd2405212c0f706111d8576dbb8e54b4'
 
  def script; <<-EOS.undent
    #!/bin/sh
    if [ -z "$1" ]; then
      echo "Usage: $ solr35 path/to/config/dir"
    else
      cd #{libexec}/example && java -Dsolr.solr.home=$1 -jar start.jar
    fi
    EOS
  end
 
  def install
    libexec.install Dir['*']
    (bin+'solr35').write script
  end
 
  def caveats; <<-EOS.undent
    To start solr:
      solr path/to/solr/config/dir
 
    See the solr homepage for more setup information:
      brew home solr
    EOS
  end
end
