;; Nutritionist Verification Contract
;; This contract validates nutrition professionals' credentials

(define-data-var admin principal tx-sender)

;; Data map to store verified nutritionists
(define-map nutritionists
  { address: principal }
  {
    name: (string-utf8 100),
    credentials: (string-utf8 200),
    specialization: (string-utf8 100),
    verified: bool,
    verification-date: uint
  }
)

;; Public function to register a nutritionist (only admin can verify)
(define-public (register-nutritionist (name (string-utf8 100)) (credentials (string-utf8 200)) (specialization (string-utf8 100)))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (ok (map-set nutritionists
      { address: tx-sender }
      {
        name: name,
        credentials: credentials,
        specialization: specialization,
        verified: false,
        verification-date: u0
      }
    ))
  )
)

;; Admin function to verify a nutritionist
(define-public (verify-nutritionist (address principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u403))
    (asserts! (is-some (map-get? nutritionists { address: address })) (err u404))
    (ok (map-set nutritionists
      { address: address }
      (merge (unwrap-panic (map-get? nutritionists { address: address }))
        {
          verified: true,
          verification-date: block-height
        }
      )
    ))
  )
)

;; Read-only function to check if a nutritionist is verified
(define-read-only (is-verified-nutritionist (address principal))
  (match (map-get? nutritionists { address: address })
    nutritionist (get verified nutritionist)
    false
  )
)

;; Read-only function to get nutritionist details
(define-read-only (get-nutritionist-details (address principal))
  (map-get? nutritionists { address: address })
)
