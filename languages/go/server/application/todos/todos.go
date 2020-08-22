package todos

type Repository interface {
	Create(task string) error
	Get() ([]Todo, error)
}

type Todo struct {
	task string
}

type Todos struct {
	r Repository
}

func (t *Todos) Create(task string) error {
	return t.r.Create(task)
}

func (t *Todos) Get() ([]Todo, error) {
	return t.r.Get()
}
