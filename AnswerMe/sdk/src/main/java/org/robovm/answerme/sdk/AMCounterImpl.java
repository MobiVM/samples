/*
 * Copyright (C) 2015 RoboVM AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.robovm.answerme.sdk;

import org.robovm.answerme.core.Counter;
import org.robovm.apple.foundation.Foundation;
import org.robovm.apple.foundation.NSObject;
import org.robovm.objc.annotation.CustomClass;
import org.robovm.objc.annotation.Method;
import org.robovm.objc.annotation.Property;


@CustomClass("AMCounterImpl")
public class AMCounterImpl extends NSObject {

    private final Counter counter;

    public AMCounterImpl (Counter counter) {
        this.counter = counter;
    }

    @Method(selector = "init")
    public AMCounterImpl () {
        Foundation.log("AMCounterImpl#init: from java");
        this.counter = new Counter(0);
    }

    @Method(selector = "addValue:")
    public void addValue (int value) {
        Foundation.log("AMCounterImpl#addValue:" + value + "  from java");
        this.counter.addValue(value);
    }

    @Method(selector = "minusValue:")
    public void minusValue (int value) {
        Foundation.log("AMCounterImpl#minusValue:" + value + "  from java");
        this.counter.minusValue(value);
    }

    @Property(selector = "value")
    public int getValue () {
        Foundation.log("AMCounterImpl#property#value: from java");
        return counter.getValue();
    }


}
