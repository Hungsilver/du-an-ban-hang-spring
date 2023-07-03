package com.example.assignment;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class AssignmentApplicationTests {

    @Test
    public void runn(){
        Map<Integer,Integer> maps = new HashMap<>();
        maps.put(0,55);
        maps.put(1,56);
        maps.put(1,22);

        maps.forEach((k,v)->{
            System.out.println(k+" - "+v);
        });
    }
}
