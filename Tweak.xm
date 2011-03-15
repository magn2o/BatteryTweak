%hook SpringBoard

- (void)batteryStatusDidChange:(id)batteryStatus
{
	float currentCapacity = [[batteryStatus objectForKey:@"CurrentCapacity"] intValue]; //1352
	float designCapacity = [[batteryStatus objectForKey:@"DesignCapacity"] intValue]; //1420

	float currentLevel = (currentCapacity / designCapacity) * 100;
	int currentPercent = (int) currentLevel;

	NSString *batteryLevel = [NSString stringWithFormat: @"%i", currentPercent];

	NSError *error;

	[batteryLevel writeToFile:@"/tmp/BatteryLevel" atomically: YES encoding: NSUTF8StringEncoding error: &error];

	%orig;
}
	
%end
