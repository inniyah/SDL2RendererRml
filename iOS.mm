#ifdef IOS
#import "main.h"

@implementation iphoneViewerAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {

    //NSBundle *bundle = [NSBundle mainBundle];
    //NSDictionary *info = [bundle infoDictionary];
    //NSString *prodName = [info objectForKey:@"CFBundleExecutable"];
    //std::string appname = std::string([prodName UTF8String]); //NSString to std::string
    //NSString *epath = [[NSBundle mainBundle] executablePath];
    //std::string exe_path = std::string([epath UTF8String]); //NSString to std::string

    //NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
	//NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Populator"];
	//NSString *folderPath = [documentsDirectory stringByAppendingPathComponent:@"Files"];
	//NSLog(@"Source Path: %@\n Documents Path: %@ \n Folder Path: %@", sourcePath, documentsDirectory, folderPath); 
	
    App app(0,0);  //argc, argv);
	App::active = true;
    		
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self selector:@selector(updateScene) userInfo:nil repeats:YES];
}

- (void)updateScene
{
    while(App::active){
		App::loop();
	}
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    App::exit();
} 

- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
    //Use a basic low-pass filter to only keep the gravity in the accelerometer values
    accel[0] = acceleration.x * 30.0 + accel[0] * (1.0 - 0.1);
    accel[1] = acceleration.y * 30.0 + accel[1] * (1.0 - 0.1);
    accel[2] = acceleration.z * 30.0 + accel[2] * (1.0 - 0.1);
}

- (void)dealloc
{
    //[super dealloc];
}

@end
#endif //IOS
