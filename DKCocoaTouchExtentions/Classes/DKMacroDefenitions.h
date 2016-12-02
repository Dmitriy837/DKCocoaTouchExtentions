//
//  MacroDefenitions.h
//  MobileTaxi-iOS
//
//  Created by Dmytro on 12/1/16.
//  Copyright © 2016 Uklon. All rights reserved.
//

#ifndef MacroDefenitions_h
#define MacroDefenitions_h

#define PROPERTY_NO_NIL(property, class) -(class*)property{if (!_##property){_##property = [class new];}return _##property;}
#define PROPERTY_NO_NIL_WITH_CONSTRUCTOR(property, class, constructor) -(class*)property{if (!_##property){_##property = [class constructor];}return _##property;}
#define PROPERTY_NO_NIL_WITH_DEFAULT_VALUE(property, defaultValue) -(id)property{if (!_##property){_##property = defaultValue;}return _##property;}
#define SINGLETON_GETTER(getterName, className) static className *instance;+(instancetype)getterName{if(!instance){instance=[self new];}return instance;}
#define SINGLETON_GETTER_THREAD_SAFE(getterName, className) static className *instance;+(instancetype)getterName{if(!instance){dispatch_once_t token;dispatch_once(&token, ^{instance=[self new];});}return instance;}
#define STATIC_PROPERTY_GETTER(getterName, className, singletonGetter) +(className*)getterName{return [[self singletonGetter] getterName];}
#define STATIC_PROPERTY_SETTER(setterName, className, singletonGetter) +(void)setterName:(className*)value{[[self singletonGetter] setterName:value];}

#endif /* MacroDefenitions_h */
