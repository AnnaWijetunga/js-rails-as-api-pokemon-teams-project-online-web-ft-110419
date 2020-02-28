class PokemonsController < ApplicationController
    def index
        pokemons = Pokemon.all
        render json: PokemonSerializer.new(pokemons)
    end

    def create
        trainer = Trainer.find_by(id: params[:trainer_id])
        trainer.pokemons.create(nickname: Faker::Name.first_name, species: Faker::Games::Pokemon.name)
        render json: trainer.pokemons.last
    end

    def show
        pokemon = Pokemon.find_by(id: params[:id])
        if pokemon
            render json: PokemonSerializer.new(pokemon)
        else
            render json: { message: 'Pokemon not found' }
        end
    end 

    def destroy
        pokemon = Pokemon.find_by(id: params[:id])
        pokemon.destroy 
    end

end