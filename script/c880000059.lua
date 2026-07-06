-- AUTO-GENERATED: EB01-059 / 뇌영
-- rules_id=EB01-059 script_id=880000059 fingerprint=6fede63be8d8d18afea403a7ac8a43744773499310732183eea191fb724ba464
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            count=1,
            from=[[TOP]],
            op=[[TRASH_LIFE_UNTIL]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】상대의 캐릭터를 1장까지 KO 시킨다. 그 후, 자신의 라이프가 1장이 되도록 라이프 위에서부터 트래시로 보낸다.]],
        timings={
          [[MAIN]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte_life_total=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[서로의 라이프 합계 이하의 코스트를 가진 상대의 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-059]],
    schema_version=1,
  })
end
