package main

import (
	"fmt"

	"github.com/ilyakaznacheev/cleanenv"
)

type ConfigDatabase struct {
	Port     string `yaml:"port" env:"PORT" env-default:"5432"`
	Host     string `yaml:"host" env:"HOST" env-default:"localhost"`
	Name     string `yaml:"name" env:"NAME" env-default:"postgres"`
	User     string `yaml:"user" env:"USER" env-default:"user"`
	Password string `env:"PASSWORD"`
}

func main() {
	var cfg ConfigDatabase

	err := cleanenv.ReadConfig("config.yml", &cfg)
	if err != nil {
		panic(err)
	}

	fmt.Println(cfg)
}
