node 'PuppetAgent' {

	class {'::tomcat':
		user		=> 'tomcat7',
		group		=> 'root',
		service_state	=> 'running'
	}
	tomcat::deploy { "sysfoo":
		deploy_url	=> 'https://2-116104469-gh.circle-artifacts.com/0/tmp/circle-artifacts.gBh1FuT/sysfoo.war',
		checksum_value	=> '631fcf77c6102d75cba588a3d6b49cb3'
	}
	include prefs
	include base
}

node 'PuppetAgent1' {


        class {'::tomcat':
                user            => 'tomcat',
                group           => 'root',
                service_state   => 'running'
        }

        include prefs
        include base
}


#would execute if no definition is given for a certain node
node default {
	notify { "init":
		message	=> "---Default Block---
		Initializing...
		"
	}
}
