-- AUTO-GENERATED: OP07-103 / 토니토니 쵸파
-- rules_id=OP07-103 script_id=880000958 fingerprint=f74629aa44c38e3f5c99a4be3d3eb073460e7f1a55ab8625795e1e92218a9017
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[BLOCKER]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                trait=[[에그 헤드]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            op=[[ADD_SELF_TO_HAND]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이번 턴 동안, 자신의 《에그 헤드》 특징을 가진 캐릭터 1장까지는 【블로커】를 얻는다. 그 후, 이 카드를 패에 더한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-103]],
    schema_version=1,
  })
end
