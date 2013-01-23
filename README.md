[![Build Status](https://travis-ci.org/msonnabaum/application_foreman.png)](https://travis-ci.org/msonnabaum/application_foreman)

# Description

This cookbook provides an LWRP for using foreman to export your Procfile settings to init scripts.

# Resources/Providers

foreman_export

## Attribute Parameters

See foreman for documentation on export options: http://ddollar.github.com/foreman

- format
- location
- app
- log
- user
- env
- template_dir: A directory of templates to pass to the --template option.
- foreman_command: The command to execute when calling foreman.  Useful for specifing alternate commands such as RVM wrappers.  Defaults to `foreman`.


# Usage

Basic usage with upstart.

```{ruby}
application "my-app" do
  path "..."
  repository "..."
  revision "..."

  foreman_export do
    format 'upstart'
    location '/etc/init'
    app "my-app"
    user "root"
    log "/var/log/my-app"
  end
end
```

You can specify custom a foreman command if needed. This example uses the jruby cookbook to specify these paths.

```{ruby}
application "my-app" do
  path "..."
  repository "..."
  revision "..."

  foreman_export do
    format 'upstart'
    location '/etc/init'
    app "xhprof-server"
    user "root"
    log "/var/log/xhprof-server"
    env 'JRUBY_HOME' => "#{node[:jruby][:install_path]}",
        'PATH' => "$PATH:$JRUBY_HOME/bin",
        'JRUBY_OPTS' => '--1.9'
    foreman_command "#{node[:jruby][:install_path]}/bin/foreman"
  end
end
```
