platos = {
    'Cheeseburguer' => 'Hamburguesa con queso', 
    'Papas Fritas' => 'Papas fritas a la perfección', 
    'Bebida' =>'Bebida gaseosa con hielo', 
    'Galletas' => 'Deliciosas galletas horneadas en el restaurant', 
    'Nuggets'=> '10 Nuggets de pollo frito',
    'Chicken Strips' => 'Tiritas de pollo de la mejor calidad'
}

restaurantes = [
    'Rincon de Rati',
    'Fonda del Tio Yadran',
    'Kurger Bing',
    'Peter, John y Diego',
    'Pizza hot'
]

admin = User.create(
                id: 1000,
                email: "admin@admin.com",
                password: "admin1",
                admin: true)

puts admin.inspect

user = User.create(
                id: 1001,
                nombre: "matias",
                imagen: "pez.jpg",
                direccion: "calle n",
                email: "matias@gmail.com",
                password: "usuario1")

puts user.inspect


rid = 10000
pid = 10000
restaurantes.each do |name|
    under_name = name.parameterize.underscore
    r = Restaurante.create(
                       id: rid, nombre: name,
                       email: "#{under_name}@restaurante.com", 
                       direccion: "calle #{rand(100..999)}",
                       # valoracion: (rand()*5).round(2),
                       imagen: "#{under_name }.jpg", 
                       telefono: rand(70000000..99999999),
                       password: "#{under_name}123",
                       status: "aprobado",
                       valoracion: 0)

    platos.keys.sample(4).each do |n_plato|
        p = Plato.create(
                    id: pid, nombre: n_plato, precio: rand(1..20) * 500,
                    descripcion: platos[n_plato], n_personas: rand(1..4),
                    imagenes: "#{n_plato}.png", valoracion: (rand()*5).round(2), 
                    restaurante_id: rid)
        pid += 1
        # puts p.inspect
    end
    rid += 1
    puts r.inspect
end







