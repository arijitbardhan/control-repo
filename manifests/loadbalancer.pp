node 'PuppetAgent2' {

	include ::haproxy
	
	haproxy::listen { 'load-balancer':

        	collect_exported => false,
	        ipaddress        => $::ipaddress,
	        ports            => '80'
	}

	haproxy::balancermember { 'PuppetAgent':
	
	       listening_service => 'load-balancer',
	       server_names      => 'PuppetAgent',
               ipaddresses       => 'puppetagent01.southeastasia.cloudapp.azure.com',
               ports             => '8080',
               options           => 'check',
  	}

	haproxy::balancermember { 'PuppetAgent1':
   	       listening_service => 'load-balancer',
               server_names      => 'PuppetAgent1',
               ipaddresses       => 'puppetagent02.southeastasia.cloudapp.azure.com',
               ports             => '8080',
               options           => 'check',
  	}

}
