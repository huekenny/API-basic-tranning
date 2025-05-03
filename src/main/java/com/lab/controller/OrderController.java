package com.lab.controller;

import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @GetMapping
    public ResponseEntity<List<String>> getOrders() {
        return ResponseEntity.ok(List.of("order-001", "order-002"));
    }

    @PostMapping
    public ResponseEntity<String> createOrder() {
        return ResponseEntity.status(HttpStatus.CREATED).body("order created");
    }

    @GetMapping("/error")
    public ResponseEntity<?> simulateError() {
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                .body(Map.of("error", "Server failed"));
    }
}
