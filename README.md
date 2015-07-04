### Spring MVC with AngularJS
This application was initially designed as a sample web app 
for a purposes of performance monitoring with Apache JMeter concept demo (refer pom.xml for the corresponding blog article url).

Anyway, it could be treated as a standalone Spring MVC with AngularJS example.  

### Technology Stack
* JDK 8
* Apache Maven v.3.2
* Java EE 7.0 (Servlets, JSTL)
* Spring Framework v.4.1.6.RELEASE (MVC and other libs)
* AngularJS v.1.4.1
* Apache Tomcat Server v.8.0.20
* Apache JMeter v.2.13

### Build Instructions
Invoke the following maven command from the app root dir:

`mvn clean package`

Examine build log, make sure build was successful:

`[INFO] BUILD SUCCESS`

*Optionally:*

*Setup Apache JMeter on your machine:*
[*guide*](http://jmeter.apache.org/usermanual/jmeter_proxy_step_by_step.pdf)

*JMeter test scenario example:*
[*angular-spring-mvc.jmx*](!files/angular-spring-mvc.jmx) 

### Launch Instructions
Once the app is assembled, deploy angular-spring-mvc.war to a Tomcat server.

a. Client-side:
`the root is index.jsp - it holds all the .js scripting logic and .css styling.` 
 
b. Server-side:
`the entry point is SessionController class, which is Spring MVC @Controller.`
