-- AUTO-GENERATED: EB03-050 / 코니스
-- rules_id=EB03-050 script_id=880002153 fingerprint=1e3975dd65ad55341766cb3d2b3ce5a0c4526128645132c2ce78c21d883fee8c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB03-050]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              filter={
                trait=[[하늘섬]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】이번 턴 동안, 자신의 《하늘섬》 특징을 가진 캐릭터 1장까지는 【더블 어택】을 얻는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[EB03-050]],
    schema_version=1,
  })
end
