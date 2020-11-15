# ARC-Memory Management in Swift

- How to code in Swift for optimal memory management.
- What reference cycles are.
- How to break them using an example of a reference cycle.

Swift handles much of the memory management of your apps and allocates or deallocates memory on your behalf. It does so using a feature of the Clang compiler called ***Automatic Reference Counting***, or ***ARC***

With an understanding of this system, you can influence when the **life of a heap object** ends. Swift uses ARC to be predictable and efficient in resource-constrained environments.

ARC works automatically, so you don’t need to participate in reference counting, but you do need to **consider relationships between objects to avoid memory leaks**. This is an important requirement that is often overlooked by new developers.

-- Code --

### An Object’s Lifetime

1. ***Allocation***: Takes memory from a stack or heap.
2. ***Initialization***: `init` code runs.
3. ***Usage***.
4. ***Deinitialization***: `deinit` code runs.
5. ***Deallocation***: Returns memory to a stack or heap.

There are no direct hooks into allocation and deallocation, but you can use `print` statements in `init` and `deinit` as a proxy for monitoring those processes.

***Reference counts*, also known as *usage counts*, determine when an object is no longer needed. This count indicates how many “things” reference the object. The object is no longer needed when its usage count reaches zero and no clients of the object remain. The object then deinitializes and deallocates.**

**At the end of function(), object goes out of scope and the reference count decrements to 0. As a result, object deinitializes and subsequently deallocates**.

## Reference Cycles

In most cases, ARC works like a charm. As an app developer, you don’t usually have to worry about memory leaks, where unused objects stay alive indefinitely. Leaks can happen!

How can these leaks occur? Imagine a situation where two objects are no longer required, but each references the other. Since each has a non-zero reference count, *neither* object can deallocate.

![img](https://koenig-media.raywenderlich.com/uploads/2016/05/ReferenceCycle-650x208.png)

This is a **strong reference cycle**. It fools ARC and prevents it from cleaning up.

As you can see, the reference count at the end is not zero, and even though neither is still required, `object1` and `object2` are never deallocated.

## Weak References

To break strong reference cycles, you can specify the relationship between reference counted objects as `weak`.

- Unless otherwise specified, all references are strong and impact reference counts.
- Weak references, however, don’t increase the reference count of an object.
- Weak references don’t participate in the lifecycle management of an object.
- Weak references are always declared as *optional* types. This means when the reference count goes to zero, the reference can automatically be set to `nil`.

![WeakReference](https://koenig-media.raywenderlich.com/uploads/2016/05/WeakReference-650x279.png)

In the image above, the dashed arrow represents a weak reference. Notice how the reference count of `object1` is 1 because `variable1` refers to it. The reference count of `object2` is 2, because both `variable2` and `object1` refer to it.

While `object2` references `object1`, it does so weakly, meaning it doesn’t affect the strong reference count of `object1`.

When both `variable1` and `variable2` go away, `object1` will have a reference count of zero and `deinit` will run. This removes the strong reference to `object2`, which subsequently deinitializes.

