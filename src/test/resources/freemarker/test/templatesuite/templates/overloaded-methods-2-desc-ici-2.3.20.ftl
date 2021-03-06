<@assertFails message="no compatible overloaded">${obj.mVarargs('a', obj.getNnS('b'), obj.getNnS('c'))}</@>
<@assertFails message="no compatible overloaded">${obj.mChar('a')}</@>
<@assertFails message="no compatible overloaded">${obj.mIntPrimVSBoxed(123?long)}</@>
<@assertEquals actual=obj.mIntPrimVSBoxed(123?short) expected="mIntPrimVSBoxed(int a1 = 123)" />
<@assertEquals actual=obj.mIntPrimVSBoxed(123) expected="mIntPrimVSBoxed(int a1 = 123)" />
<@assertEquals actual=obj.varargs4(1, 2, 3) expected='varargs4(int... xs = [1, 2, 3])' />

<@assertFails message="multiple compatible overloaded">${obj.mVarargsIgnoredTail(1, 2, 3)}</@>
<@assertFails message="multiple compatible overloaded">${obj.mVarargsIgnoredTail(1, 2, 3.5)}</@>

<@assertEquals actual=obj.mLowRankWins(1, 2, 'a') expected='mLowRankWins(int x = 1, int y = 2, Object o = a)' />

<@assertEquals actual=obj.mRareWrappings(obj.file, obj.adaptedNumber, obj.adaptedNumber, obj.adaptedNumber, obj.stringWrappedAsBoolean)
               expected='mRareWrappings(File f = file, double d1 = 123.0001, Double d2 = 123.0002, double d3 = 124.0, b = true)' />
<@assertFails message="no compatible overloaded">${obj.mRareWrappings(obj.stringWrappedAsBoolean, obj.adaptedNumber, obj.adaptedNumber, obj.adaptedNumber, obj.stringAdaptedToBoolean)}</@>
<@assertFails message="no compatible overloaded">${obj.mRareWrappings(obj.booleanWrappedAsAnotherBoolean, 0, 0, 0, obj.booleanWrappedAsAnotherBoolean)}</@>
<@assertFails message="no compatible overloaded">${obj.mRareWrappings(obj.adaptedNumber, 0, 0, 0, !obj.booleanWrappedAsAnotherBoolean)}</@>
<@assertFails message="no compatible overloaded">${obj.mRareWrappings(obj.booleanWrappedAsAnotherBoolean, 0, 0, 0, !obj.stringAdaptedToBoolean)}</@>

<#include 'overloaded-methods-2-ici-2.3.20.ftl'>
