#group { 'puppet': ensure => 'present' }

class { 'mysql::server':
  config_hash => { 'root_password' => 'root-kcsql', 'bind_address' => $ipaddress }
}

mysql::db { 'mydb':
  user     => 'user',
  password => 'pass',
  host => '%',
  grant    => ['all'],
}
