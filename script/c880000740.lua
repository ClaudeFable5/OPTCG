-- AUTO-GENERATED: OP06-006 / 사가
-- rules_id=OP06-006 script_id=880000740 fingerprint=2a4566f87cf63cf58a0e845bb7a36f605e1743b75714eee3f5b4585501ba70d5
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-006]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[UNTIL_YOUR_NEXT_TURN_START]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            op=[[TRASH]],
            schedule=[[THIS_TURN_END]],
            selector={
              count=1,
              filter={
                trait=[[FILM]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】다음 자신의 턴 개시 시까지, 이 캐릭터의 파워 +1000. 그 후, 이번 턴 종료 시, 자신의 《FILM》 특징을 가진 캐릭터 1장을 트래시에 놓는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-006]],
    schema_version=1,
  })
end
