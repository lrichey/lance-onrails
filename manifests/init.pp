# == Class: onrails
#
# TODO description of this module
#
# === Parameters
#
# [*message_type*]
# The type of message to display.
# Options: hello | bye
#
# [*receiver*]
# The name of the person receiving the message
#
# === Examples
#
# * basic usage
#     include onrails
#
#
# * passing in parameters
#     class { 'onrails':
#       message_type => bye,
#       receiver     => 'Leeroy',
#     }
#
# === Authors
#
# * user <mailto:user@email.com>
#
# === References
# * Module Fundamentals
# @see http://docs.puppetlabs.com/puppet/3/reference/modules_fundamentals.html
#
class onrails (
  $receiver     = 'Leeroy',
  $message_type = hello,
) {

  # Puppet Selector structure
  # @see http://docs.puppetlabs.com/learning/variables.html#selectors
  $message = $message_type ? {
    hello => 'Well hello there',
    bye   => 'Well sya later',
  }

  # The $message variable is accessible within the template below
  # @see http://docs.puppetlabs.com/guides/templating.html
  file { '/etc/motd':
    ensure  => file,
    content => template('onrails/etc/motd.erb'),
  }
}
