UltraLayout
==========

UltraLayout allows you to easily create autolayout constraints with compile-time syntax checking.

For example:

    // Put leftView to the right of rightView, touching.
    [leftView.ul constrainToBeside:rightView.ul];
    // Equivalent to: [leftView.ul.right constrainTo:rightView.ul.left];
    
    // Make the tops and bottoms of leftView and rightView line up
    [leftView.ul constrainToVerticalEdges:rightView.ul];
    
    // Make leftView and rightView fill the width of their superview
    [leftView.ul.left constrainToSuperview];
    [rightView.ul.right constrainToSuperview];
    
    // Stick them to the vertical center and give them a fixed maximum height.
    [leftView.ul.centerY constrainToSuperview];
    [leftView.ul.height constrainToSuperviewWithOffset:0 priority:UILayoutPriorityDefaultHigh];
    [leftView.ul.height constrainUpToValue:100];

UltraLayout includes type features that ensure that bizarre, likely nonsensical constraints cause compiler warnings:

    [rightView.ul.width constrainTo:leftView.ul.right];
    // Warning: Incompatible pointer types sending 'ULXPositionAttribute *' to parameter of type 'ULDimensionAttribute *'

UltraLayout also adds a new UIView initializer that returns autolayout-ready views:

    UIView * myView = [[UIView alloc] initWithSuperview:anotherView];
    [myView.ul.left constrainTo:anotherView.ul.left];

And NSLayoutConstraint methods to easily add a constraint:

    [aConstraint add];  // Automatically decides a view to use
    [UIView animateWithDuration:0.5 animations:^{ [self.view layoutIfNeeded]; } completion:^{ [aConstraint remove]; }];

UltraLayout is available on both iOS and OS X, with an essentially identical API on both platforms.

Isn't the name a bit much?
-----------------------

Well, it's pretty cool, but maybe not "ultra". UltraLayout was originally written for [Converter Neue](https://itunes.apple.com/us/app/converter-neue/id690448568?mt=8), which carried the codename UltraLight.

Author
-----

Brent Royal-Gordon, [Architechies](http://architechies.com).

File issues or pull requests at the [UltraLayout GitHub project](http://github.com/brentdax/ultralayout).

License
-----

MIT should be fine, don't you think?

> Copyright (C) 2013-14 Architechies.
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


