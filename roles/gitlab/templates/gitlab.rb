external_url "https://gitlab-az.enciso.site/"

gitlab_rails['time_zone'] = 'America/Sao_Paulo'

nginx['client_max_body_size'] = '250m'
nginx['redirect_http_to_https'] = 'True'
nginx['ssl_certificate'] = "/etc/gitlab/ssl/enciso.site.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/enciso.site.key"

gitlab_rails['ldap_enabled'] = true                                                                                                                                                                                
                                                                                                                                                                                                                   
gitlab_rails['ldap_servers'] = {
'main' => {
  'label' => 'Gitlab AD',
  'host' =>  'ad.aws.enciso.site',
  'port' => 389,
  'uid' => 'sAMAccountName',
  'encryption' => 'plain',
  'verify_certificates' => false,
  'bind_dn' => 'Administrator@internal.enciso.site',
  'password' => '{{ ad_administrator_password }}',
  'active_directory' => true,
  'base' => 'CN=Users,DC=internal,DC=enciso,DC=site',
  'group_base' => 'CN=Groups,DC=internal,DC=enciso,DC=site',
  'admin_group' => 'Global Admins'
  }
}

gitlab_rails['gitlab_signup_enabled'] = true

gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "relay.enciso.site"
gitlab_rails['smtp_port'] = 25
