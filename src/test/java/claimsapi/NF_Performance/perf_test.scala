package performance

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._
import scala.concurrent.duration._

class GWClaimAPI extends Simulation {

  val protocol = karateProtocol(
  
  )

 

  val getAllClaims = scenario("Get all the Claims in the system").exec(karateFeature("classpath:claimsapi/NF_Performance/perf.feature"))
 

  setUp(
    getAllClaims.inject(rampUsers(20) during (6 seconds)).protocols(protocol), // ramp up 20 users at regular interval for 6 seconds, OPEN MODEL  Control arrival rate


    

  )

}
/*

http://localhost:9090

 //protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")
  //protocol.runner.karateEnv("perf")

   //val delete = scenario("delete").exec(karateFeature("classpath:mock/cats-delete.feature@name=delete"))

   /*
    getAllClaims.inject(
        atOnceUsers(1)
    ).protocols(protocol)
    */

    /* simulation 2
    getAllClaims.inject(
    nothingFor(4), // 1
    atOnceUsers(10), // 2
    rampUsers(10).during(5), // 3
    constantUsersPerSec(20).during(15), // 4
    constantUsersPerSec(20).during(15).randomized, // 5
    rampUsersPerSec(10).to(20).during(10.minutes), // 6
    rampUsersPerSec(10).to(20).during(10.minutes).randomized, // 7
    stressPeakUsers(1000).during(20) // 8
  ).protocols(protocol)
  */

*/