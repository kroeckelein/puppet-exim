# == Define: exim::transport
#
# This module configures a single transport in exims configuration
#
# === Parameters
#
# [*allow_localhost*]
#   Allow connections to localhost
#
# [*comment*]
#   Comment a router, this will be placed as a comment just above
#   the router.
#
# [*driver*]
#   Type of transport.
#
# [*protocol*]
#   Protocol of transport.
#
# [*connect_timeout*]
#   Timeout when connecting to remote Servers.
#
# [*connection_max_messages*]
#   Set the maximum number of messages that can be transfered in a single connection.
#
# [*exim_environment*]
#   This option is used to add additional variables to the environment in which the command runs.
#
# [*fallback_hosts*]
#   If Exim is unable to deliver to any of the hosts for a particular address, and the
#   errors are not permanent rejections, the address is put on a separate transport
#   queue with its host list replaced by the fallback hosts.
#
# [*from*]
#  sets the from address
#
# [*helo_data*]
#  sets the helo name exim uses when connecting to a remote server.
#
# [*headers_remove*]
#  list of headers to remove.
#
# [*headers_add*]
#  list of headers to add.
#
# [*hosts*]
#   The hosts option specifies a list of hosts to be used if the address
#   being processed does not have any hosts associated with it. The hosts
#   specified by hosts are also used, whether or not the address has its
#   own hosts, if hosts_override is set.
#
# [*hosts_require_auth*]
#   Specifies a list of servers for which authentication must succeed before Exim will try
#   to transfer a message. If authentication fails for one of these servers, delivery is deferred.
#
# [*hosts_require_tls*]
#   List of hosts requiring tls, messages are only sent if tls can be established.
#
# [*hosts_try_auth*]
#   The host_try_auth option provides a list of hosts to which, provided they announce
#   authentication support, Exim will attempt to authenticate as a client when it connects.
#
# [*path*]
#   This option specifies the string that is set up in the
#   PATH environment variable of the subprocess.
#
# [*port*]
#   The port exim connects to on the remote server
#
# [*return_fail_output*]
#   If set to true, the command output is returned in the bounce message in case of failure.
#
# [*return_output*]
#   If this option is true, and the command produced any output, the delivery
#   is deemed to have failed whatever the return code from the command, and
#   the output is returned in the bounce message
#
# [*timeout*]
#   If the command fails to complete within this time, it is killed.
#
# [*timeout_defer*]
#   Set this to true for timeouts to become temporary errors, causing the delivery to be deferred.
#
# [*tls_dh_min_bits*]
#   set the minimum acceptable number of bits in the Diffie-Hellman prime offered by a server,
#   default is 1024
#
# [*tls_verify_certificates*]
#   Give a path to certificates agains which connections are verified.
#
# [*interface*]
#   sets the outgoing ip for smtp transports.
#
# [*dkim_domain*]
#   The domain(s) you want to sign with
#
# [*dkim_selector*]
#   This sets the key selector string.
#
# [*dkim_private_key*]
#    This sets the private key to use. You can use the $dkim_domain and $dkim_selector expansion
#    variables to determine the private key to use. The result can either
#     - be a valid RSA private key in ASCII armor, including line breaks.
#     - start with a slash, in which case it is treated as a file that contains the private key.
#     - be "0", "false" or the empty string, in which case the message will not be signed. This case will not result in an error, even if dkim_strict is set.
#
# [*dkim_canon*]
#   This option sets the canonicalization method used when signing a message.
#   The DKIM RFC currently supports two methods: "simple" and "relaxed".
#   Note: the current implementation only supports using the same canonicalization method for both headers and body.
#
# [*dkim_strict*]
#   This option defines how Exim behaves when signing a message that should be signed fails for some reason.
#   When the expansion evaluates to either "1" or "true", Exim will defer.
#   Otherwise Exim will send the message unsigned.
#   You can use the $dkim_domain and $dkim_selector expansion variables here.
#
# [*once*]
#   Use:autoreply;Type:string;Default:unset; This option names a file or DBM database in which a record of each To: recipient is kept when the message is 
#   specified by the transport. 
#
# [*once_repeat*]
#   Use:autoreply;Type:time;Default:0s; specifies a maximum time between repeats
#
# [*once_file_size*]
#   Use:autoreply;Type:integer;Default:0; If once_file_size is zero, a DBM database is used to remember recipients, and it is allowed to grow as large as necessary. 
#   If once_file_size is set greater than zero, it changes the way Exim implements the once option. Instead of using a DBM file to record every recipient it sends 
#   to, it uses a regular file, whose size will never get larger than the given value. 
#
# [*headers*]
#   Use:autoreply;Type:string;Default:unset; This specifies additional RFC 2822 headers that are to be added to the message when the message is specified by the 
#   transport. Several can be given by using “\n” to separate them. There is no check on the format.
#
# [*return_message*]
#   Use:autoreply;Type:boolean;Default:false; If this is set, a copy of the original message is returned with the new message, subject to the maximum size set in 
#   the return_size_limit global configuration option.

define exim::transport (
  $driver,
  $protocol                = undef,
  $allow_localhost         = false,
  $batch_max               = undef,
  $command                 = undef,
  $comment                 = undef,
  $connection_max_messages = undef,
  $connect_timeout         = undef,
  $delivery_date_add       = false,
  $directory_mode          = undef,
  $directory               = undef,
  $dkim_domain             = undef,
  $dkim_selector           = undef,
  $dkim_private_key        = undef,
  $dkim_canon              = undef,
  $dkim_strict             = undef,
  $envelope_to_add         = false,
  $fallback_hosts          = undef,
  $file                    = undef,
  $freeze_exec_fail        = false,
  $from                    = undef,
  $group                   = undef,
  $headers_add             = undef,
  $headers_remove          = undef,
  $helo_data               = undef,
  $home_directory          = undef,
  $hosts_require_auth      = undef,
  $hosts_require_tls       = undef,
  $hosts_try_auth          = undef,
  $exim_environment        = undef,
  $hosts                   = undef,
  $initgroups              = false,
  $interface               = undef,
  $log_output              = false,
  $maildir_format          = false,
  $maildir_tag             = undef,
  $message_prefix          = undef,
  $message_suffix          = undef,
  $mode                    = undef,
  $path                    = undef,
  $port                    = undef,
  $rcpt_include_affixes    = false,
  $return_fail_output      = false,
  $return_output           = false,
  $return_path_add         = false,
  $socket                  = undef,
  $subject                 = undef,
  $temp_errors             = undef,
  $timeout                 = undef,
  $timeout_defer           = false,
  $text                    = undef,
  $tls_dh_min_bits         = undef,
  $tls_verify_certificates = undef,
  $to                      = undef,
  $transport_filter        = undef,
  $user                    = undef,
  $once                    = undef,
  $once_repeat             = undef,
  $once_file_size          = undef,
  $headers                 = undef,
  $return_message          = undef,
  ){
  if ($directory)               { validate_re($directory              ,'^.+$') }
  if ($command)                 { validate_re($command                ,'^.+$') }
  if ($connect_timeout)         { validate_re($connect_timeout        ,'^.+$') }
  if ($directory_mode)          { validate_re($directory_mode         ,'^.+$') }
  if ($file)                    { validate_re($file                   ,'^.+$') }
  if ($from)                    { validate_re($from                   ,'^.+$') }
  if ($group)                   { validate_re($group                  ,'^.+$') }
  if ($home_directory)          { validate_re($home_directory         ,'^.+$') }
  if ($maildir_tag)             { validate_re($maildir_tag            ,'^.+$') }
  if ($message_prefix)          { validate_re($message_prefix         ,'^.+$') }
  if ($message_suffix)          { validate_re($message_suffix         ,'^.+$') }
  if ($mode)                    { validate_re($mode                   ,'^.+$') }
  if ($path)                    { validate_re($path                   ,'^.+$') }
  if ($socket)                  { validate_re($socket                 ,'^.+$') }
  if ($subject)                 { validate_re($subject                ,'^.+$') }
  if ($text)                    { validate_re($text                   ,'^.+$') }
  if ($to)                      { validate_re($to                     ,'^.+$') }
  if ($transport_filter)        { validate_re($transport_filter       ,'^.+$') }
  if ($timeout)                 { validate_re($timeout                ,'^.+$') }
  if ($tls_verify_certificates) { validate_re($tls_verify_certificates,'^.+$') }
  if ($user)                    { validate_re($user                   ,'^.+$') }
  if ($interface)               { validate_re($interface              ,'^.+$') }
  if ($helo_data)               { validate_re($helo_data              ,'^.+$') }
  if ($dkim_selector)           { validate_re($dkim_selector          ,'^.+$') }
  if ($dkim_private_key)        { validate_re($dkim_private_key       ,'^.+$') }
  if ($dkim_canon)              { validate_re($dkim_canon             ,'^.+$') }
  if ($once)                    { validate_re($once                   ,'^.+$') }
  if ($once_repeat)             { validate_re($once_repeat            ,'^.+$') }
  if ($once_file_size)          { validate_re($once_file_size         ,'^.+$') }
  if ($headers)                 { validate_re($headers                ,'^.+$') }
  if ($return_message)          { validate_re($return_message         ,'^.+$') }

  if ($temp_errors)       { validate_array($temp_errors       ) }
  if ($hosts)             { validate_array($hosts             ) }
  if ($headers_remove)    { validate_array($headers_remove    ) }
  if ($headers_add)       { validate_array($headers_add       ) }
  if ($fallback_hosts)    { validate_array($fallback_hosts    ) }
  if ($exim_environment)  { validate_array($exim_environment  ) }
  if ($hosts_require_auth){ validate_array($hosts_require_auth) }
  if ($hosts_require_tls) { validate_array($hosts_require_tls ) }
  if ($hosts_try_auth)    { validate_array($hosts_try_auth    ) }
  if ($dkim_domain)       { validate_array($dkim_domain       ) }

  if ($batch_max)               { validate_re("x${batch_max}"               ,'^x[0-9]+$') }
  if ($port)                    { validate_re("x${port}"                    ,'^x[0-9]+$') }
  if ($connection_max_messages) { validate_re("x${connection_max_messages}" ,'^x[0-9]+$') }
  if ($tls_dh_min_bits)         { validate_re("x${tls_dh_min_bits}"         ,'^x[0-9]+$') }
  if ($dkim_strict)             { validate_re("x${dkim_strict}"             ,'^x[0-9]+$') }

  validate_bool($delivery_date_add,$envelope_to_add,$freeze_exec_fail,$initgroups,
                $log_output,$maildir_format,$return_path_add,$rcpt_include_affixes,
                $allow_localhost,$return_output,$return_fail_output,$timeout_defer)

  concat::fragment { "transport-${title}":
    target  => $::exim::config_path,
    content => template("${module_name}/transport/transport.erb"),
    order   => 3001,
  }
}
