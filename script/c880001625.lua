-- AUTO-GENERATED: OP13-053 / 마샬 D. 티치
-- rules_id=OP13-053 script_id=880001625 fingerprint=ba95c1ee61f556dea82228c23b31b87a50561e2c56d6eb9a9ba6a243fd76aaa8
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP13-053]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[BANISH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                trait_contains=[[흰 수염 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】자신의 『흰 수염 해적단』을 포함한 특징을 가진 캐릭터 1장을 트래시에 놓을 수 있다: 카드를 1장 뽑고, 이번 턴 동안, 이 캐릭터는 【배니시】를 얻는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP13-053]],
    schema_version=1,
  })
end
