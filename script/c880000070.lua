-- AUTO-GENERATED: EB02-009 / 사우전드 써니 호
-- rules_id=EB02-009 script_id=880000070 fingerprint=288d812d21b600bd279867bafafe0ea687addc55af3d63ca65af898583b235fa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRANSFER_ATTACHED_DON]],
            player=[[YOU]],
            selector={
              count=1,
              filter={
                trait=[[밀짚모자 일당]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 스테이지를 레스트할 수 있다: 자신의 부여되어 있는 두웅!!을 1장까지 자신의 《밀짚모자 일당》 특징을 가진 캐릭터 1장에게 부여한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-009]],
    schema_version=1,
  })
end
