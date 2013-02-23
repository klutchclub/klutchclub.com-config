group { 'puppet': ensure => 'present' }

class { 'mysql::server':
  config_hash => { 'root_password' => 'root-kcsql' }
}

mysql::db { 'mydb':
  user     => 'user',
  password => 'pass',
  host => '%',
  grant    => ['all'],
}
