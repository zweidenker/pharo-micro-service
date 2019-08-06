baselines
baseline: spec
	<baseline>
        
	spec for: #common do: [
   		spec 
			package: 'MicroService-Core' with: [ spec requires: #( 'Stamp' 'Beacon' 'Metrics' 'NeoJSON') ];
			
			baseline: 'Beacon' with: [ 
				spec 
					repository: 'github://pharo-project/pharo-beacon:v1.4/repository';
					loads: #( 'Core' 'Beacon-Syslog') ];
									
			baseline: 'Stamp' with: [
				spec
					repository: 'github://zweidenker/stamp/repository' ];
							
			baseline: 'Metrics' with: [ 
				 spec 
					repository: 'github://zweidenker/pharo-metrics:0.1/source'];
				
			baseline: 'NeoJSON' with: [ 
				spec 
					repository: 'github://svenvc/NeoJSON:master/repository' ].
			"baseline: 'RestStack' with: [ 
				 spec 
					loads: 'exception';
					repository: 'github://zweidenker/pharo-rest/source'];"
				
			"baseline: 'Metrics' with: [ 
				 spec 
					repository: 'github://zweidenker/pharo-metrics/source'];"
								
		spec
			group: 'Core' with: #('MicroService-Core') ].