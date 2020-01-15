# Set up regular Puppet runs
file { '/usr/local/bin/run-puppet':
  source => '/etc/puppetlabs/code/environments/production/files/run-puppet.sh',
  mode   => '0755',
}

cron { 'run-puppet':
  command => '/usr/local/bin/run-puppet',
  hour    => '*',
  minute  => '*/15',
}

file { '/tmp/hello.txt':
  content => "hello world"
}

exec { 'say_hello':
  command => '/bin/echo This is `whoami` > /tmp/say_hello.txt',
  user    => 'ubuntu',
  creates => '/tmp/say_hello.txt'
}
