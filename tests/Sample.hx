// Copyright (c) 2012, 杨博 (Yang Bo)
// All rights reserved.
// 
// Author: 杨博 (Yang Bo) <pop.atry@gmail.com>
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
// 
// * Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// * Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// * Neither the name of the <ORGANIZATION> nor the names of its contributors
//   may be used to endorse or promote products derived from this software
//   without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

package tests;
import com.dongxiguo.continuation.Async;
import com.dongxiguo.continuation.Continuation;

/**
* @author 杨博
*/
class Sample
{
  static function sleepOneSecond(handler:Void->Void):Void
  {
    haxe.Timer.delay(handler, 1000);
  }
  
  public static function main() 
  {
    Continuation.cpsFunction(function asyncTest():Void
    {
      trace("Start continuation.");
      for (i in 0...10)
      {
        @await sleepOneSecond();
        trace("Run sleepOneSecond " + i + " times.");
      }
      trace("Continuation is done.");
    });
    
    asyncTest(function()
    {
      trace("Handler without continuation.");
    });
  }
  
}


/**
* @author 杨博
*/
class Sample2 implements Async
{
  static function sleepOneSecond(handler:Void->Void):Void
  {
    haxe.Timer.delay(handler, 1000);
  }
  @async static function asyncTest():Void
  {
    trace("Start continuation.");
    for (i in 0...10)
    {
      @await sleepOneSecond();
      trace("Run sleepOneSecond " + i + " times.");
    }
    trace("Continuation is done.");
  }
  public static function main() 
  {
    asyncTest(function()
    {
      trace("Handler without continuation.");
    });
  }
}
