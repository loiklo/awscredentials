# This class manage the /root/.aws/credentials file
#
# @summary This class manage the /root/.aws/credentials file
#
# @param awsprofiles
#   Hash of api_keys
class awscredentials (
  Hash    $awsprofiles = {},
) {

  # Create the directory
  exec { '/usr/bin/mkdir -p /root/.aws':
    unless => ['/usr/bin/test -d /root/.aws']
  }

  # Fill the credentials file
  concat {
    '/root/.aws/credentials':
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Exec['/usr/bin/mkdir -p /root/.aws']
  }

  $awsprofiles.each | String $profilename, Hash $profile_hash | {

    $profile_fragment = "[${profilename}]
aws_access_key_id=${profile_hash[aws_access_key_id]}
aws_secret_access_key=${profile_hash[aws_secret_access_key]}
"

    concat::fragment {
      "awscredential_${profilename}":
      target  => '/root/.aws/credentials',
      content => $profile_fragment,
      order   => $profilename;
    }

  }

}
