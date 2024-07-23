resource "aws_route53_record" "www" {
    zone_id = "Z07219192GFUIG44V4PBY"
    type = "A"
    
    name = "fashion.dev-guro.info"
    # to recall public ip. copy from output public ip address
      alias {
         name    = aws_lb.application-lb.dns_name
        zone_id = aws_lb.application-lb.zone_id
        evaluate_target_health = true
      }
  
}