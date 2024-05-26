package claimsapi;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import net.masterthought.cucumber.ReportBuilder;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.Collection;

import org.junit.jupiter.api.Test;

//import for cucumber report
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;

class ClaimsTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:claimsapi/feature/gwapis_claim.feature","classpath:claimsapi/feature/karate_features.feature")
                .outputCucumberJson(true) //cucum uncomment
                .parallel(5);
        //assertEquals(0, results.getFailCount(), results.getErrorMessages()); // cucm comment

        generateReport(results.getReportDir());
        assertTrue(results.getFailCount() == 0, results.getErrorMessages());
    }

    public static void generateReport(String karateOutputPath) {
        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList<>(jsonFiles.size());
        jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        Configuration config = new Configuration(new File("target"), "GW Karate");
        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
        reportBuilder.generateReports();
    }

}



