"use client"

import { AlertTriangleIcon, ChevronRightIcon, CircleHelpIcon, DropletsIcon, MapPinIcon, Undo2Icon } from "lucide-react"
import * as React from "react"

const situations = [
  {
    id: "dropear",
    title: "Necesito dropear",
    summary: "Confirma primero la Regla que te da alivio y mide el área correcta.",
    rule: "Regla 14.3",
    penalty: "Depende de la Regla aplicable",
    icon: Undo2Icon,
    steps: [
      "Identifica el punto de referencia y el tamaño del área de alivio.",
      "Droppa tú mismo la bola, recta hacia abajo, desde la altura de la rodilla.",
      "La bola debe tocar primero el terreno dentro del área de alivio (o sobre la línea cuando aplique) y quedar en reposo dentro de ella.",
    ],
    note: "Una bola dropeada incorrectamente debe dropearse de nuevo antes de jugarla.",
    source: "https://www.randa.org/es-ES/rog/the-rules-of-golf/rule-14",
  },
  {
    id: "penalizacion",
    title: "Mi bola está en un área de penalización",
    summary: "Puedes jugarla como reposa o tomar alivio con penalización.",
    rule: "Regla 17.1",
    penalty: "1 golpe de penalización al aliviarse",
    icon: DropletsIcon,
    steps: [
      "Confirma el último punto por donde la bola cruzó el margen del área.",
      "En área amarilla: golpe y distancia o alivio en línea hacia atrás.",
      "En área roja: además puedes tomar alivio lateral dentro de dos palos, no más cerca del hoyo.",
    ],
    note: "Si es conocido o virtualmente cierto que la bola quedó en el área, puedes aplicar la Regla 17 aunque no la encuentres.",
    source: "https://www.randa.org/es-ES/rog/the-rules-of-golf/rule-17",
  },
  {
    id: "perdida",
    title: "No encuentro mi bola o está fuera de límites",
    summary: "La opción estándar es golpe y distancia; revisa si existe una Regla Local alternativa.",
    rule: "Regla 18.2 y 18.3",
    penalty: "1 golpe de penalización",
    icon: MapPinIcon,
    steps: [
      "Busca durante un máximo de tres minutos desde que inicia la búsqueda.",
      "Si está perdida o fuera de límites, juega otra bola desde donde ejecutaste el golpe anterior.",
      "Para ahorrar tiempo, anuncia y juega una bola provisional cuando corresponda antes de ir a buscar.",
    ],
    note: "Algunos campos adoptan una Regla Local para el alivio alternativo; consulta las reglas locales antes de usarla.",
    source: "https://www.randa.org/es-ES/rog/the-rules-of-golf/rule-18",
  },
  {
    id: "injugable",
    title: "Mi bola es injugable",
    summary: "Tú decides declararla injugable, excepto que esté dentro de un área de penalización.",
    rule: "Regla 19.2",
    penalty: "1 golpe de penalización",
    icon: AlertTriangleIcon,
    steps: [
      "Puedes volver al lugar del golpe anterior (golpe y distancia).",
      "O tomar alivio en línea hacia atrás, manteniendo la posición de la bola entre el hoyo y el punto de dropaje.",
      "O tomar alivio lateral dentro de dos palos del punto de reposo, no más cerca del hoyo.",
    ],
    note: "En un búnker las opciones con un golpe deben permanecer en el búnker; existe una opción adicional fuera del búnker con dos golpes.",
    source: "https://www.randa.org/es-ES/rog/the-rules-of-golf/rule-19",
  },
] as const

export function FieldGuide() {
  const [activeId, setActiveId] = React.useState<(typeof situations)[number]["id"]>("dropear")
  const activeSituation = situations.find((situation) => situation.id === activeId) ?? situations[0]
  const Icon = activeSituation.icon

  return (
    <section id="resolver-en-el-campo" className="scroll-mt-8 rounded-2xl border bg-card p-5 shadow-sm md:p-7">
      <div className="flex flex-col justify-between gap-4 md:flex-row md:items-end">
        <div>
          <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Resolver en el campo</p>
          <h2 className="mt-2 text-2xl font-semibold tracking-tight">¿Qué situación tienes?</h2>
          <p className="mt-2 max-w-2xl text-sm leading-6 text-muted-foreground">Selecciona una situación para ver el procedimiento esencial. Esta guía no sustituye las Reglas de Golf ni las reglas locales del campo.</p>
        </div>
        <div className="inline-flex items-center gap-2 text-sm text-muted-foreground"><CircleHelpIcon className="size-4" /> Consulta rápida · Reglas 2023</div>
      </div>

      <div className="mt-6 grid gap-3 sm:grid-cols-2 xl:grid-cols-4">
        {situations.map((situation) => {
          const SituationIcon = situation.icon
          const isActive = situation.id === activeId
          return (
            <button
              key={situation.id}
              type="button"
              onClick={() => setActiveId(situation.id)}
              className={`rounded-xl border p-4 text-left transition focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none ${isActive ? "border-emerald-700 bg-emerald-50 shadow-sm" : "border-border bg-background hover:border-emerald-300 hover:bg-emerald-50/50"}`}
            >
              <SituationIcon className={`size-5 ${isActive ? "text-emerald-700" : "text-muted-foreground"}`} />
              <p className="mt-3 font-semibold">{situation.title}</p>
              <p className="mt-1 text-sm leading-5 text-muted-foreground">{situation.summary}</p>
            </button>
          )
        })}
      </div>

      <article className="mt-6 grid overflow-hidden rounded-xl border border-emerald-900/10 bg-emerald-950 text-emerald-50 lg:grid-cols-[0.85fr_1.15fr]">
        <div className="p-6 md:p-8">
          <div className="flex size-11 items-center justify-center rounded-full bg-emerald-800"><Icon className="size-5" /></div>
          <p className="mt-5 text-sm font-medium text-emerald-300">{activeSituation.rule}</p>
          <h3 className="mt-2 text-2xl font-semibold">{activeSituation.title}</h3>
          <p className="mt-3 text-sm leading-6 text-emerald-100">{activeSituation.summary}</p>
          <p className="mt-6 inline-flex rounded-full bg-amber-300 px-3 py-1 text-xs font-semibold text-amber-950">{activeSituation.penalty}</p>
        </div>
        <div className="border-t border-white/10 bg-white/5 p-6 md:p-8 lg:border-t-0 lg:border-l">
          <p className="text-sm font-semibold text-white">En el campo, sigue estos pasos</p>
          <ol className="mt-4 space-y-4">
            {activeSituation.steps.map((step, index) => (
              <li key={step} className="flex gap-3 text-sm leading-6 text-emerald-50"><span className="flex size-6 shrink-0 items-center justify-center rounded-full bg-emerald-700 text-xs font-semibold">{index + 1}</span>{step}</li>
            ))}
          </ol>
          <p className="mt-5 rounded-lg border border-emerald-300/20 bg-black/20 p-3 text-sm leading-6 text-emerald-100">{activeSituation.note}</p>
          <a href={activeSituation.source} target="_blank" rel="noreferrer" className="mt-5 inline-flex items-center gap-1 text-sm font-medium text-emerald-300 hover:text-emerald-200">Ver fuente oficial <ChevronRightIcon className="size-4" /></a>
        </div>
      </article>
    </section>
  )
}
