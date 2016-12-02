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
#define SINGLETON_GETTER(getterName) static instancetype instance;+(instancetype)getterName{if(!instance){instance=[self new];}return instance;}
#define SINGLETON_GETTER_WITH_VARIABLE(getterName, variableName) +(instancetype)getterName{if(!variableName){variableName=[self new];}return instance;}
#define SINGLETON_GETTER_THREAD_SAFE_WITH_VARIABLE(getterName, variableName)+(instancetype)getterName{if(!variableName){dispatch_once_t token;dispatch_once(&token, ^{variableName=[self new];});}return instance;}
#define STATIC_PROPERTY_GETTER(getterName, class, singletonGetter) +(class*)getterName{return [[self singletonGetter] getterName];}

#endif /* MacroDefenitions_h */
