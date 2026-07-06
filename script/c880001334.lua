-- AUTO-GENERATED: OP10-119 / 트라팔가 로
-- rules_id=OP10-119 script_id=880001334 fingerprint=d0dd0b2f2f6b47fab39928d126203f0ff3a84bb2cea9ec56a3ec0e58c5eb3f3d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP10-119]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            faceup=false,
            filter={
              card_type=[[CHARACTER]],
              trait=[[초신성]],
            },
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_HAND]],
            player=[[YOU]],
            reveal=true,
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_DON]],
            player=[[YOU]],
            selector={
              count=1,
              filter={
                trait=[[초신성]],
              },
              kind=[[LEADER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《초신성》 특징을 가진 캐릭터 카드를 1장까지 공개하고 라이프 맨 위에 뒷면으로 더한다. 그 후, 자신의 《초신성》 특징을 가진 리더 1장에게 레스트 상태인 두웅!!을 1장까지 부여한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP10-119]],
    schema_version=1,
  })
end
