#Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

-keep class android.arch.lifecycle.** {*;}
-keep class androidx.lifecycle.** {*;}

# Core SDK
-keep class zendesk.core.** { *; }

# Gson
-keep class sun.misc.Unsafe { *; }

# Okio
-dontwarn okio.**

# Retrofit
-dontwarn retrofit2.Platform**

# Dagger
-dontwarn com.google.errorprone.annotations.CanIgnoreReturnValue

# OkHttp3: https://github.com/square/okhttp/blob/master/okhttp/src/main/resources/META-INF/proguard/okhttp3.pro
## JSR 305 annotations are for embedding nullability information.
-dontwarn javax.annotation.**

## A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase

## Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*

## OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform
# Support SDK
-keepnames class zendesk.support.** { *; }

# Gson
-keep class sun.misc.Unsafe { *; }

# Okio
-dontwarn okio.**

# Retrofit
-dontwarn retrofit2.Platform**

# java-common
-dontwarn java.awt.Color

# Dagger
-dontwarn com.google.errorprone.annotations.*
#Picasso
-dontwarn com.squareup.okhttp.**

# MenuItems
-keep class android.support.v7.widget.SearchView { *; }
-keep class zendesk.support.request.ViewCellAttachmentMenuItem { *; }

# Guide Main Screen
-keep class zendesk.support.HelpCenterSettings { *; }
-keep class zendesk.support.HelpResponse { *; }
-keep class zendesk.support.ArticlesListResponse { *; }
-keep class zendesk.support.CategoryItem { *; }
-keep class zendesk.support.SectionItem { *; }
-keep class zendesk.support.ArticleItem { *; }
-keep class zendesk.support.SeeAllArticlesItem { *; }
-keep class zendesk.support.guide.HelpCenterActivity { *; }

# Guide Search Results
-keep class zendesk.support.guide.HelpSearchFragment { *; }
-keep class zendesk.support.ArticlesSearchResponse { *; }
-keep class zendesk.support.SearchArticle { *; }
-keep class zendesk.support.guide.HelpSearchRecyclerViewAdapter { *; }
-keep class zendesk.support.HelpCenterSearch { *; }
-keep class zendesk.support.Category { *; }
-keep class zendesk.support.Section { *; }
-keep class zendesk.support.Article { *; }

# Guide View Article
-keep class zendesk.support.guide.ArticleViewModel { *; }
-keep class zendesk.support.guide.ArticleConfiguration { *; }
-keep class zendesk.support.guide.ViewArticleActivity { *; }
-keep class zendesk.support.ArticleResponse { *; }
-keep class zendesk.support.ArticleVote { *; }
-keep class zendesk.support.ArticleVoteResponse { *; }
-keep class zendesk.support.ZendeskArticleVoteStorage { *; }
-keep class zendesk.support.AttachmentResponse { *; }
-keep class zendesk.support.HelpCenterAttachment { *; }

# Support Requests (Create, Update, List)
-keep class zendesk.support.request.** { *; }
-keep class zendesk.support.requestlist.** { *; }
-keep class zendesk.support.SupportSdkSettings { *; }
-keep class zendesk.support.Request { *; }
-keep class zendesk.support.CreateRequest { *; }
-keep class zendesk.support.Comment { *; }
-keep class zendesk.support.CommentResponse { *; }
-keep class zendesk.support.CommentsResponse { *; }
-keep class zendesk.support.EndUserComment { *; }
-keep class zendesk.support.ZendeskRequestStorage { *; }
-keep class zendesk.support.ZendeskRequestProvider { *; }
-keep class zendesk.support.CreateRequestWrapper { *; }
-keep class zendesk.support.UpdateRequestWrapper { *; }
-keep class zendesk.support.RequestsResponse { *; }
-keep class zendesk.support.RequestResponse { *; }

# Support Attachments
-keep class zendesk.support.UploadResponse { *; }
-keep class zendesk.support.UploadResponseWrapper { *; }
-keep class zendesk.support.ZendeskUploadProvider { *; }
-keep class zendesk.support.Attachment { *; }