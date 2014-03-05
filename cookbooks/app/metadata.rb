name "app"
maintainer "Michael Simonini"
maintainer_email ""
description "Main entry point for installing and configuring a dead-simple LAMP stack"
version "1.0.0"

recipe "app", "Main entry point for installing and configuring a dead-simple LAMP stack"

depends "apt"

%w{ debian ubuntu }.each do |os|
  supports os
end
