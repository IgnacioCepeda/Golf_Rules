import { AppSidebar } from "@/components/app-sidebar"
import Image from "next/image"
import { HomeIcon } from "lucide-react"
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from "@/components/ui/breadcrumb"
import { Separator } from "@/components/ui/separator"
import {
  SidebarInset,
  SidebarProvider,
  SidebarTrigger,
} from "@/components/ui/sidebar"

const conceptSections = [
  { title: "Bases y dropear", description: "Principios esenciales, alivio y el procedimiento correcto para dropear.", href: "/dashboard/bases-y-dropear", status: "Disponible" },
]

const placeSections = [
  { title: "Mesas de salida", description: "Cómo iniciar el hoyo, corregir errores y jugar desde el área de salida.", href: "/dashboard/mesa-de-salida", status: "Disponible" },
  { title: "Área general del campo", description: "Situaciones generales en Fairway, Rough, Waste Area, Barbas, Fringe, etc. Es decir, todas las áreas del campo con excepción de Bunkers de Arena, Green, Mesas de salida y Áreas de penalidad como los lagos y zonas de vegetación marcadas con estacas rojas.", href: "/dashboard/area-general", status: "Disponible" },
  { title: "Bunker (trampas de arena)", description: "Opciones de alivio y restricciones al jugar desde la arena.", href: "/dashboard/bunker", status: "Disponible" },
  { title: "Áreas de penalidad (lagos de agua)", description: "Procedimientos para bolas en áreas amarillas y rojas.", href: "/dashboard/areas-de-penalizacion", status: "Disponible" },
  { title: "Green", description: "Reglas al marcar, levantar y jugar la bola en el green.", href: "/dashboard/green", status: "Disponible" },
]

export default function Page() {
  return (
    <SidebarProvider>
      <AppSidebar />
      <SidebarInset>
        <header className="flex h-16 shrink-0 items-center gap-2 border-b px-4">
          <SidebarTrigger className="-ml-1" />
          <Separator
            orientation="vertical"
            className="mr-2 data-vertical:h-4 data-vertical:self-auto"
          />
          <Breadcrumb>
            <BreadcrumbList>
              <BreadcrumbItem className="hidden md:block">
                <BreadcrumbLink href="/dashboard">La Liga</BreadcrumbLink>
              </BreadcrumbItem>
              <BreadcrumbSeparator className="hidden md:block" />
              <BreadcrumbItem>
                <BreadcrumbPage>Guía de reglas</BreadcrumbPage>
              </BreadcrumbItem>
            </BreadcrumbList>
          </Breadcrumb>
          <a href="/dashboard" aria-label="Volver al menú principal" title="Menú principal" className="ml-auto inline-flex size-9 items-center justify-center rounded-md text-emerald-800 transition hover:bg-emerald-50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none">
            <HomeIcon className="size-5" />
          </a>
        </header>
        <main className="flex flex-1 flex-col gap-6 p-4 md:p-8">
          <section className="overflow-hidden rounded-2xl bg-black text-emerald-50">
            <div className="flex flex-col items-center px-6 py-8 text-center md:px-10 md:py-10">
              <div className="relative h-28 w-44 shrink-0 md:h-32 md:w-52">
                <Image
                  src="/la-liga-ycc-logo.png"
                  alt="La Liga YCC"
                  fill
                  priority
                  sizes="208px"
                  className="object-contain"
                />
              </div>
              <h1 className="mt-5 max-w-3xl text-3xl font-semibold tracking-tight md:text-5xl">Reglas claras para disfrutar mejor cada ronda.</h1>
              <p className="mt-4 max-w-2xl text-base leading-7 text-emerald-300 md:text-lg">Consulta una situación de juego, entiende el procedimiento y juega con confianza.</p>
            </div>
          </section>
          <section aria-labelledby="secciones-principales">
            <div className="mb-4">
              <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Resolver en el campo</p>
              <h2 id="secciones-principales" className="mt-1 text-2xl font-semibold tracking-tight">Secciones principales</h2>
            </div>
            <p className="mb-2 text-xs font-semibold tracking-[0.18em] text-muted-foreground uppercase">Conceptos generales</p>
            <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
              {conceptSections.map((section) => (
                <a key={section.title} href={section.href} className="group rounded-xl border bg-card p-5 shadow-sm transition hover:border-emerald-500 hover:bg-emerald-50/50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none">
                  <div className="flex items-center justify-between gap-3">
                    <h3 className="text-lg font-semibold group-hover:text-emerald-800">{section.title}</h3>
                    <span className={`rounded-full px-2.5 py-1 text-xs font-medium ${section.status === "Disponible" ? "bg-emerald-100 text-emerald-800" : "bg-muted text-muted-foreground"}`}>{section.status}</span>
                  </div>
                  <p className="mt-2 text-sm leading-6 text-muted-foreground">{section.description}</p>
                </a>
              ))}
            </div>
            <p className="mt-7 mb-2 text-xs font-semibold tracking-[0.18em] text-muted-foreground uppercase">¿En dónde estás?</p>
            <div className="grid gap-4 sm:grid-cols-2 xl:grid-cols-3">
              {placeSections.map((section) => (
                <a key={section.title} href={section.href} className="group rounded-xl border bg-card p-5 shadow-sm transition hover:border-emerald-500 hover:bg-emerald-50/50 focus-visible:ring-2 focus-visible:ring-emerald-600 focus-visible:outline-none">
                  <div className="flex items-center justify-between gap-3">
                    <h3 className="text-lg font-semibold group-hover:text-emerald-800">{section.title}</h3>
                    <span className={`rounded-full px-2.5 py-1 text-xs font-medium ${section.status === "Disponible" ? "bg-emerald-100 text-emerald-800" : "bg-muted text-muted-foreground"}`}>{section.status}</span>
                  </div>
                  <p className="mt-2 text-sm leading-6 text-muted-foreground">{section.description}</p>
                </a>
              ))}
            </div>
          </section>
        </main>
      </SidebarInset>
    </SidebarProvider>
  )
}
