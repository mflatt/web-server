(module web-cell-component mzscheme
  (require (lib "web-cells.ss" "web-server" "prototype-web-server" "newcont"))
  (provide define-component)
  
  (define-syntax define-component
    (syntax-rules (define)
      [(_ (include-name id formals embed/url) body ...)
       (define include-name
         (lambda formals
           (let/cc k
             (define (id)
               (k
                (lambda (embed/url)
                  body ...)))
             (id))))])))