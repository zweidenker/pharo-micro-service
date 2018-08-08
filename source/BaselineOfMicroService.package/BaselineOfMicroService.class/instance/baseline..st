baselines
baseline: spec
	<baseline>
        
	spec for: #common do: [
   		spec 
			package: 'MicroService-Core' with: [ spec requires: #( 'Stamp' 'Beacon' 'Metrics') ];
			
			baseline: 'Beacon' with: [ 
				spec 
					repository: 'github://pharo-project/pharo-beacon:v1.4/repository';
					loads: #( 'Core' 'Beacon-Syslog') ];
								
			baseline: 'ExceptionReport' with: [ 
				 spec 
					repository: 'github://noha/pharo-toolbox/source'];
				
			baseline: 'Stamp' with: [
				spec
					repository: 'github://zweidenker/Stamp/source' ];
							
			baseline: 'Metrics' with: [ 
				 spec 
					repository: 'github://zweidenker/pharo-metrics/source'].
			"baseline: 'RestStack' with: [ 
				 spec 
					loads: 'exception';
					repository: 'github://zweidenker/pharo-rest/source'];"
				
			"baseline: 'Metrics' with: [ 
				 spec 
					repository: 'github://zweidenker/pharo-metrics/source'];"
								
		spec
			group: 'Core' with: #('MicroService-Core') ].