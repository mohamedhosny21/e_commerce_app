-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivity$g
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Args
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter$Error
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningActivityStarter
-dontwarn com.stripe.android.pushProvisioning.PushProvisioningEphemeralKeyProvider

# Keep all classes in the com.google.j2objc.annotations package
-keep class com.google.j2objc.annotations.** { *; }

# Keep all classes in the Google Guava library
-keep class com.google.common.** { *; }

# Preserve annotations
-keepattributes *Annotation*

# Preserve the stack map table
-keepattributes SourceFile,LineNumberTable

# Preserve classes required by Google Guava
-keep class com.google.common.util.concurrent.** { *; }
-keep class com.google.common.collect.** { *; }

# Additional rules to prevent missing classes
-keep class com.google.j2objc.annotations.ReflectionSupport { *; }
-keep class com.google.j2objc.annotations.RetainedWith { *; }
-keep class com.google.j2objc.annotations.Weak { *; }

# Suppress warnings about missing classes
-dontwarn com.google.j2objc.annotations.**
