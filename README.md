# DKCocoaTouchExtentions

Just a bunch of categories and macro definitions that I personally find useful and want to share easily between projects

## Example

The least obvious and my favourite part might be macro definitions contained in DKMacroDefenitions.h.
Say, I have a singleton object and I don't want to see 'sharedInstance' throughout the code before any single message sent to it, for instance to get singletone object's description I don't want to say

```objective-c
[[DKObject sharedInstance] description]
```

I want 

```objective-c
[DKObject description]
```

instead. And I also want it's properties to have default values. This is usual 

```objective-c
- (NSString*)objectTitle
{
    if (!_objectTitle) _objectTitle = @"Default title";
    return _objectTitle;
}
```

routine. Or I want it's properties to have guaranteed no-nil values, say, it is cruscial because of KVO. Again, it is usual

```objective-c
- (NSobject*)someObservableProperty
{
if (!_someObservableProperty) _someObservableProperty = [NSObject new];
return _someObservableProperty;
}
```

thing. What I hate the most about this situation, obviously, is the fact that once you start doing this routine you copy and paste and copy and paste over and over again until yo start questioning purpose of your existance. That's why for object, looking like

```objective-c
@interface DKObject : NSObject
@property (nonatomic, strong) NSString *objectTitle;
@property (nonatomic, strong) NSObject *someObservableProperty;
@property (nonatomic, strong) NSMutableArray *arrayOfStrings;
+ (NSString *)description;
@end
```

instead of going like

```objective-c
@implementation DKObject

- (NSObject*)someObservableProperty
{
if (!_someObservableProperty)
{
_someObservableProperty = [NSObject new];
}
return _someObservableProperty;
}

- (id)objectTitle
{
if (!_objectTitle)
{
_objectTitle = @"Default title";
}
return _objectTitle;
}

static DKObject *instance;
+(instancetype)sharedInstance
{
if(!instance)
{
dispatch_once_t token;
_dispatch_once(&token, ^{instance=[self new];
});
}
return instance;
}

- (NSMutableArray*)arrayOfStrings
{
if (!_arrayOfStrings)
{
_arrayOfStrings = [NSMutableArray arrayWithObject:@"Array content"];
}
return _arrayOfStrings;
}

+ (NSString*)description
{
return [[self sharedInstance] description];
}

- (NSString *)description
{
return [NSString stringWithFormat:@"Title: %@\nArray: %@", self.objectTitle, self.arrayOfStrings];
}
@end
```

I prefer to say

```objective-c
PROPERTY_NO_NIL                     (someObservableProperty, NSObject)
PROPERTY_NO_NIL_WITH_DEFAULT_VALUE  (objectTitle, @"Default title")
SINGLETON_GETTER_THREAD_SAFE        (sharedInstance, DKObject)
PROPERTY_NO_NIL_WITH_CONSTRUCTOR    (arrayOfStrings, NSMutableArray, arrayWithObject:@"Array content")
STATIC_PROPERTY_GETTER              (description, NSString, sharedInstance)

- (NSString *)description
{
return [NSString stringWithFormat:@"Title: %@\nArray: %@", self.objectTitle, self.arrayOfStrings];
}
```

So that we can get our description printed with all of the default values to the log with the simple call of 

```
NSLog(@"%@", [DKObject description]);

/* Prints next
Title: Default title
Array: (
"Array content"
)
*/

```

## Author

Dmytro Kovryhin, agnostic.88@yandex.ua

## License

DKCocoaTouchExtentions is available under the MIT license. See the LICENSE file for more info.
